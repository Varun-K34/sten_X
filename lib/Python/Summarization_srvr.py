

import math
import nltk
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
from flask import Flask, request, jsonify

app = Flask(__name__)

# Function to calculate the frequency of each word in a sentence
def frequency_matrix(sentences):
    freq_matrix = {}

    lemmatizer = WordNetLemmatizer()
    stopWords = set(stopwords.words("english"))

    for sent in sentences:
        freq_table = {}

        words = nltk.word_tokenize(sent.lower())
        words = [lemmatizer.lemmatize(word) for word in words if word.isalnum() and word not in stopWords]

        for word in words:
            if word in freq_table:
                freq_table[word] += 1
            else:
                freq_table[word] = 1

        freq_matrix[sent] = freq_table

    return freq_matrix

# Function to calculate Tf-Idf score of each word
def tf_idf_matrix(tf_matrix):
    tf_idf_matrix = {}

    for sent, f_table in tf_matrix.items():
        tf_idf_table = {}

        for word, tf_value in f_table.items():
            tf_idf_table[word] = float(tf_value)

        tf_idf_matrix[sent] = tf_idf_table

    return tf_idf_matrix

# Function to rate every sentence with a score calculated based on Tf-Idf
def score_sentences(tf_idf_matrix):
    sentenceScore = {}

    for sent, f_table in tf_idf_matrix.items():
        total_tfidf_score_per_sentence = sum(f_table.values())
        total_words_in_sentence = len(f_table)

        if total_words_in_sentence != 0:
            sentenceScore[sent] = total_tfidf_score_per_sentence / total_words_in_sentence

    return sentenceScore

# Function calculating the average sentence score
def average_score(sentence_score):
    total_score = sum(sentence_score.values())
    average_sent_score = (total_score / len(sentence_score))

    return average_sent_score

# Function to return the summary of the article
def create_summary(sentences, sentence_score, threshold):
    summary = ''

    for sentence in sentences:
        if sentence in sentence_score and sentence_score[sentence] >= threshold:
            summary += " " + sentence

    return summary

@app.route('/')
def index():
    return 'Welcome to the summarization server!'

@app.route('/summarize', methods=['POST'])
def summarize():
    # Retrieve the input text from the request body
    input_text = request.json['text']

    # Step 5. Tokenizing Sentences
    sentences = nltk.sent_tokenize(input_text)

    # Step 6. Creating the Frequency Matrix
    freq_matrix = frequency_matrix(sentences)

    # Step 7. Calculating Term Frequency (TF)
    tf_matrix = frequency_matrix(sentences)

    # Step 10. Calculating Tf-Idf score
    tf_idf_scores = tf_idf_matrix(tf_matrix)

    # Step 11. Calculating Sentence Scores
    sentence_scores = score_sentences(tf_idf_scores)

    # Step 12. Calculating the Average Score
    average_sentence_score = average_score(sentence_scores)

    # Step 14. Generating the Summary
    threshold = average_sentence_score
    summary = create_summary(sentences, sentence_scores, threshold)

    # Return the summary as a response
    response = {'summary': summary}
    return jsonify(response)

if __name__ == '__main__':
    app.run()

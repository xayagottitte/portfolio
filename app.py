from flask import Flask, jsonify
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)

# Update this with your actual MySQL credentials
db_config = {
    "host": "localhost",
    "user": "root",
    "password": "667195.ej",
    "database": "portfolio_db"
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/api/hero', methods=['GET'])
def get_hero():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT name, tagline FROM hero LIMIT 1")
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return jsonify(result)

@app.route('/api/about', methods=['GET'])
def get_about():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT description FROM about LIMIT 1")
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return jsonify(result)

@app.route('/api/education', methods=['GET'])
def get_education():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT degree, institution, year FROM education ORDER BY year DESC")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(result)

@app.route('/api/certifications', methods=['GET'])
def get_certifications():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT title, issuer, date FROM certifications")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)

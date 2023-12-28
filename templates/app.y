from flask import Flask, request, jsonify, render_template, redirect, url_for
import mysql.connector
import xmltodict
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity


app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = '1234'  # Change this to a secure secret key
jwt = JWTManager(app)

# Mock user data for demonstration purposes
users = {
    'admin': 'password',
    'username': 'password',
}

# MySQL database connection configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'paymentsdatamodel',  
}

# Create MySQL connection
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

################################
# Endpoint for user login and token generation
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        data = request.get_json()
        username = data.get('username')
        password = data.get('password')

        if username in users and users[username] == password:
            access_token = create_access_token(identity=username)
            return jsonify(access_token=access_token), 200
        else:
            return jsonify({'error': 'Invalid credentials'}), 401
    else:
        return jsonify({'message': 'Use POST method to log in'}), 200

# Protected endpoint requiring a valid JWT
@app.route('/protected', methods=['GET'])
@jwt_required()
def protected():
    current_user = get_jwt_identity()
    return jsonify(logged_in_as=current_user), 200


##################################

# ...

# CRUD operations for payments

@app.route('/payments', methods=['GET'])
def get_all_payments():
    cursor.execute("SELECT * FROM payments")
    payments = cursor.fetchall()
    return jsonify({'payments': payments})

@app.route('/payments/<int:payment_id>', methods=['GET'])
def get_payment(payment_id):
    cursor.execute("SELECT * FROM payments WHERE Payment_id = %s", (payment_id,))
    payment = cursor.fetchone()

    if payment:
        return jsonify({'payment': payment})
    else:
        return jsonify({'error': 'Payment not found'}), 404

@app.route('/payments', methods=['POST'])
def create_payment():
    data = request.json

    if not all(key in data for key in ['Day_date', 'Payment_method_code']):
        return jsonify({'error': 'Missing required fields'}), 400

    query = """
    INSERT INTO payments (Day_date, Payment_method_code) 
    VALUES (%s, %s)
    """

    values = (
        data['Day_date'], data['Payment_method_code']
    )

    cursor.execute(query, values)
    conn.commit()

    return jsonify({'message': 'Payment created successfully'}), 201

@app.route('/payments/<int:payment_id>', methods=['PUT'])
def update_payment(payment_id):
    data = request.json

    if not all(key in data for key in ['Day_date', 'Payment_method_code']):
        return jsonify({'error': 'Missing required fields'}), 400

    query = """
    UPDATE payments 
    SET 
    Day_date = %s, 
    Payment_method_code = %s
    WHERE Payment_id = %s
    """

    values = (
        data['Day_date'], data['Payment_method_code'],
        payment_id
    )

    cursor.execute(query, values)
    conn.commit()

    return jsonify({'message': 'Payment updated successfully'})

@app.route('/payments/<int:payment_id>', methods=['DELETE'])
def delete_payment(payment_id):
    query = "DELETE FROM payments WHERE Payment_id = %s"
    values = (payment_id,)

    cursor.execute(query, values)
    conn.commit()

    return jsonify({'message': 'Payment deleted successfully'})

# ...

# Error handling
@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Not found'}), 404

@app.errorhandler(500)
def internal_error(error):
    return jsonify({'error': 'Internal server error'}), 500
    
if __name__ == '__main__':
    # Start the Flask application
    app.run(debug=True)
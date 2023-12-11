from flask import Flask, jsonify, request
from flask_jwt_extended import JWTManager, jwt_required, create_access_token
import datetime

app = Flask(__name__)


app.config['JWT_SECRET_KEY'] = 'jwt_secret_key'
jwt = JWTManager(app)

# Added JWT authentication with a login endpoint.
# The @jwt_required() decorator secures the endpoints, requiring a valid JWT token for access.

# Data structures
users = {}
budgets = {}
actuals = {}
transactions = {}

# Utility function for filtering data
def filter_data(data, filters):
    return {key: value for key, value in data.items() if all(value.get(k) == v for k, v in filters.items())}

# User Endpoints
@app.route('/login', methods=['POST'])
def login():
    # Implement your authentication logic here
    # This is a placeholder for demonstration
    username = request.json.get('username', None)
    password = request.json.get('password', None)
    if username != 'admin' or password != 'password':
        return jsonify({"msg": "Bad username or password"}), 401
    expires = datetime.timedelta(days=7)
    access_token = create_access_token(identity=username, expires_delta=expires)
    return jsonify(access_token=access_token), 200

@app.route('/users', methods=['GET'])
@jwt_required()
def get_users():
    query_params = request.args
    filtered_users = filter_data(users, query_params)
    return jsonify(filtered_users)

@app.route('/users', methods=['POST'])
@jwt_required()
def create_user():
    user = request.json
    users[user['userID']] = user
    return jsonify(user), 201

@app.route('/users/<userID>', methods=['PUT'])
@jwt_required()
def update_user(userID):
    if userID not in users:
        return jsonify({'error': 'User not found'}), 404
    users[userID] = request.json
    return jsonify(users[userID])

@app.route('/users/<userID>', methods=['DELETE'])
@jwt_required()
def delete_user(userID):
    if userID not in users:
        return jsonify({'error': 'User not found'}), 404
    del users[userID]
    return jsonify({'message': 'User deleted successfully'})

# Repeat the structure for budgets, actuals, and transactions
# For instance:

@app.route('/budgets', methods=['GET'])
@jwt_required()
def get_budgets():
    query_params = request.args
    filtered_budgets = filter_data(budgets, query_params)
    return jsonify(filtered_budgets)

# Budget Endpoints
@app.route('/budgets', methods=['GET'])
@jwt_required()
def get_budgets():
    query_params = request.args
    filtered_budgets = filter_data(budgets, query_params)
    return jsonify(filtered_budgets)

@app.route('/budgets', methods=['POST'])
@jwt_required()
def create_budget():
    budget = request.json
    budgets[budget['budgetID']] = budget
    return jsonify(budget), 201

@app.route('/budgets/<budgetID>', methods=['PUT'])
@jwt_required()
def update_budget(budgetID):
    if budgetID not in budgets:
        return jsonify({'error': 'Budget not found'}), 404
    budgets[budgetID] = request.json
    return jsonify(budgets[budgetID])

@app.route('/budgets/<budgetID>', methods=['DELETE'])
@jwt_required()
def delete_budget(budgetID):
    if budgetID not in budgets:
        return jsonify({'error': 'Budget not found'}), 404
    del budgets[budgetID]
    return jsonify({'message': 'Budget deleted successfully'})

# Actuals Endpoints
@app.route('/actuals', methods=['GET'])
@jwt_required()
def get_actuals():
    query_params = request.args
    filtered_actuals = filter_data(actuals, query_params)
    return jsonify(filtered_actuals)

@app.route('/actuals', methods=['POST'])
@jwt_required()
def create_actual():
    actual = request.json
    actuals[actual['actualID']] = actual
    return jsonify(actual), 201

@app.route('/actuals/<actualID>', methods=['PUT'])
@jwt_required()
def update_actual(actualID):
    if actualID not in actuals:
        return jsonify({'error': 'Actual not found'}), 404
    actuals[actualID] = request.json
    return jsonify(actuals[actualID])

@app.route('/actuals/<actualID>', methods=['DELETE'])
@jwt_required()
def delete_actual(actualID):
    if actualID not in actuals:
        return jsonify({'error': 'Actual not found'}), 404
    del actuals[actualID]
    return jsonify({'message': 'Actual deleted successfully'})

# Transactions Endpoints
@app.route('/transactions', methods=['GET'])
@jwt_required()
def get_transactions():
    query_params = request.args
    filtered_transactions = filter_data(transactions, query_params)
    return jsonify(filtered_transactions)

@app.route('/transactions', methods=['POST'])
@jwt_required()
def create_transaction():
    transaction = request.json
    transactions[transaction['transID']] = transaction
    return jsonify(transaction), 201

@app.route('/transactions/<transID>', methods=['PUT'])
@jwt_required()
def update_transaction(transID):
    if transID not in transactions:
        return jsonify({'error': 'Transaction not found'}), 404
    transactions[transID] = request.json
    return jsonify(transactions[transID])

@app.route('/transactions/<transID>', methods=['DELETE'])
@jwt_required()
def delete_transaction(transID):
    if transID not in transactions:
        return jsonify({'error': 'Transaction not found'}), 404
    del transactions[transID]
    return jsonify({'message': 'Transaction deleted successfully'})

if __name__ == '__main__':
    app.run(debug=True)

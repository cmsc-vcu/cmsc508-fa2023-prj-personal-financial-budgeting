from flask import Flask, jsonify, request

app = Flask(__name__)

# Sample data
users = {}
budgets = {}
actuals = {}
transactions = {}

# User Endpoints
@app.route('/users', methods=['GET'])
def get_users():
    return jsonify(users)

@app.route('/users', methods=['POST'])
def create_user():
    user = request.json
    users[user['userID']] = user
    return jsonify(user), 201

@app.route('/users/<userID>', methods=['PUT'])
def update_user(userID):
    if userID not in users:
        return jsonify({'error': 'User not found'}), 404
    users[userID] = request.json
    return jsonify(users[userID])

@app.route('/users/<userID>', methods=['DELETE'])
def delete_user(userID):
    if userID not in users:
        return jsonify({'error': 'User not found'}), 404
    del users[userID]
    return jsonify({'message': 'User deleted successfully'})

# Budgets Endpoints
@app.route('/budgets', methods=['GET'])
def get_budgets():
    return jsonify(budgets)

@app.route('/budgets', methods=['POST'])
def create_budget():
    budget = request.json
    budgets[budget['budgetID']] = budget
    return jsonify(budget), 201

@app.route('/budgets/<budgetID>', methods=['PUT'])
def update_budget(budgetID):
    if budgetID not in budgets:
        return jsonify({'error': 'Budget not found'}), 404
    budgets[budgetID] = request.json
    return jsonify(budgets[budgetID])

@app.route('/budgets/<budgetID>', methods=['DELETE'])
def delete_budget(budgetID):
    if budgetID not in budgets:
        return jsonify({'error': 'Budget not found'}), 404
    del budgets[budgetID]
    return jsonify({'message': 'Budget deleted successfully'})

# Actuals Endpoints
@app.route('/actuals', methods=['GET'])
def get_actuals():
    return jsonify(actuals)

@app.route('/actuals', methods=['POST'])
def create_actual():
    actual = request.json
    actuals[actual['actualID']] = actual
    return jsonify(actual), 201

@app.route('/actuals/<actualID>', methods=['PUT'])
def update_actual(actualID):
    if actualID not in actuals:
        return jsonify({'error': 'Actual not found'}), 404
    actuals[actualID] = request.json
    return jsonify(actuals[actualID])

@app.route('/actuals/<actualID>', methods=['DELETE'])
def delete_actual(actualID):
    if actualID not in actuals:
        return jsonify({'error': 'Actual not found'}), 404
    del actuals[actualID]
    return jsonify({'message': 'Actual deleted successfully'})

# Transactions Endpoints
@app.route('/transactions', methods=['GET'])
def get_transactions():
    return jsonify(transactions)

@app.route('/transactions', methods=['POST'])
def create_transaction():
    transaction = request.json
    transactions[transaction['transID']] = transaction
    return jsonify(transaction), 201

@app.route('/transactions/<transID>', methods=['PUT'])
def update_transaction(transID):
    if transID not in transactions:
        return jsonify({'error': 'Transaction not found'}), 404
    transactions[transID] = request.json
    return jsonify(transactions[transID])

@app.route('/transactions/<transID>', methods=['DELETE'])
def delete_transaction(transID):
    if transID not in transactions:
        return jsonify({'error': 'Transaction not found'}), 404
    del transactions[transID]
    return jsonify({'message': 'Transaction deleted successfully'})

# Run the Flask app
if __name__ == '__main__':
    app.run(debug=True)
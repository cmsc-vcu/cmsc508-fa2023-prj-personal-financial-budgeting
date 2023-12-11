from flask import request, jsonify
from . import app, db
from .models import User, Budget, Actual, Transaction

# User Routes
@app.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    return jsonify([user.to_dict() for user in users])

@app.route('/users', methods=['POST'])
def create_user():
    user_data = request.json
    user = User(**user_data)
    db.session.add(user)
    db.session.commit()
    return jsonify(user.to_dict()), 201

@app.route('/users/<userID>', methods=['PUT'])
def update_user(userID):
    user = User.query.get(userID)
    if not user:
        return jsonify({'error': 'User not found'}), 404
    for key, value in request.json.items():
        setattr(user, key, value)
    db.session.commit()
    return jsonify(user.to_dict())

@app.route('/users/<userID>', methods=['DELETE'])
def delete_user(userID):
    user = User.query.get(userID)
    if not user:
        return jsonify({'error': 'User not found'}), 404
    db.session.delete(user)
    db.session.commit()
    return jsonify({'message': 'User deleted successfully'})

# Budget Routes
@app.route('/budgets', methods=['GET'])
def get_budgets():
    budgets = Budget.query.all()
    return jsonify([budget.to_dict() for budget in budgets])

@app.route('/budgets', methods=['POST'])
def create_budget():
    budget_data = request.json
    budget = Budget(**budget_data)
    db.session.add(budget)
    db.session.commit()
    return jsonify(budget.to_dict()), 201

@app.route('/budgets/<budgetID>', methods=['PUT'])
def update_budget(budgetID):
    budget = Budget.query.get(budgetID)
    if not budget:
        return jsonify({'error': 'Budget not found'}), 404
    for key, value in request.json.items():
        setattr(budget, key, value)
    db.session.commit()
    return jsonify(budget.to_dict())

@app.route('/budgets/<budgetID>', methods=['DELETE'])
def delete_budget(budgetID):
    budget = Budget.query.get(budgetID)
    if not budget:
        return jsonify({'error': 'Budget not found'}), 404
    db.session.delete(budget)
    db.session.commit()
    return jsonify({'message': 'Budget deleted successfully'})

# Actual Routes
@app.route('/actuals', methods=['GET'])
def get_actuals():
    actuals = Actual.query.all()
    return jsonify([actual.to_dict() for actual in actuals])

@app.route('/actuals', methods=['POST'])
def create_actual():
    actual_data = request.json
    actual = Actual(**actual_data)
    db.session.add(actual)
    db.session.commit()
    return jsonify(actual.to_dict()), 201

@app.route('/actuals/<actualID>', methods=['PUT'])
def update_actual(actualID):
    actual = Actual.query.get(actualID)
    if not actual:
        return jsonify({'error': 'Actual not found'}), 404
    for key, value in request.json.items():
        setattr(actual, key, value)
    db.session.commit()
    return jsonify(actual.to_dict())

@app.route('/actuals/<actualID>', methods=['DELETE'])
def delete_actual(actualID):
    actual = Actual.query.get(actualID)
    if not actual:
        return jsonify({'error': 'Actual not found'}), 404
    db.session.delete(actual)
    db.session.commit()
    return jsonify({'message': 'Actual deleted successfully'})

# Transaction Routes
@app.route('/transactions', methods=['GET'])
def get_transactions():
    transactions = Transaction.query.all()
    return jsonify([transaction.to_dict() for transaction in transactions])

@app.route('/transactions', methods=['POST'])
def create_transaction():
    transaction_data = request.json
    transaction = Transaction(**transaction_data)
    db.session.add(transaction)
    db.session.commit()
    return jsonify(transaction.to_dict()), 201

@app.route('/transactions/<transID>', methods=['PUT'])
def update_transaction(transID):
    transaction = Transaction.query.get(transID)
    if not transaction:
        return jsonify({'error': 'Transaction not found'}), 404
    for key, value in request.json.items():
        setattr(transaction, key, value)
    db.session.commit()
    return jsonify(transaction.to_dict())

@app.route('/transactions/<transID>', methods=['DELETE'])
def delete_transaction(transID):
    transaction = Transaction.query.get(transID)
    if not transaction:
        return jsonify({'error': 'Transaction not found'}), 404
    db.session.delete(transaction)
    db.session.commit()
    return jsonify({'message': 'Transaction deleted successfully'})

# Run the Flask app
if __name__ == '__main__':
    app.run(debug=True)
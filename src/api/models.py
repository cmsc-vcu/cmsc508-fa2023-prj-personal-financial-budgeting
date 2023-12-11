from . import db

class User(db.Model):
    userID = db.Column(db.String(255), primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    # Additional fields as per your database design

class Budget(db.Model):
    budgetID = db.Column(db.String(255), primary_key=True)
    priceGain = db.Column(db.Float)
    source = db.Column(db.String(255))
    actual = db.Column(db.String(255))
    timePeriod = db.Column(db.String(255))

class Actual(db.Model):
    actualID = db.Column(db.String(255), primary_key=True)
    transaction = db.Column(db.String(255))
    budget = db.Column(db.String(255))
    timePeriod = db.Column(db.String(255))

class Transaction(db.Model):
    transID = db.Column(db.String(255), primary_key=True)
    priceGain = db.Column(db.Float)
    source = db.Column(db.String(255))
    actual = db.Column(db.String(255))
    date = db.Column(db.String(255))

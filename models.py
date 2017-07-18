from app import db
import datetime
import uuid

class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String(64), index=True, unique=False)
    last_name = db.Column(db.String(64), index=True, unique=False)
    email = db.Column(db.String(120), index=True, unique=False)
    password = db.Column(db.String(120), index=True, unique=False)
    long_id = db.Column(db.String(120), index=True, unique=False)
    registered_on = db.Column('registered_on' , db.DateTime)
    confirmed = db.Column(db.Boolean, unique=False, default=False)
    confirmed_on = db.Column(db.DateTime, unique=False)
    role = db.Column(db.String(64), index=False, unique=False)
    
    def __init__(self, email, confirmed_on=None, role=None):
        self.email = email
        self.registered_on = datetime.datetime.utcnow()
        self.long_id = str(uuid.uuid4())
        self.confirmed_on = confirmed_on
        self.role = role
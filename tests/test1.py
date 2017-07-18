import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import redis
import unittest

from app import app, db
from models import *

class TestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()
        db.create_all()

    def tearDown(self):
        db.session.remove() 
        db.drop_all()

    def test_index(self):
        res = self.app.get('/')
        assert 'World' in res.data
    
    def test_redis(self):
        rs = redis.from_url(os.environ['REDIS_URL'])
        rs.set('foo', 'bar')
        value = rs.get('foo')
        assert 'bar' in value

    def test_pg(self):
        new_user = User(email="admin@gmail.com", role='admin')
        db.session.add(new_user)
        db.session.commit()
            
    
if __name__ == '__main__':
    unittest.main()
import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import unittest

from app import app, db
from models import *
from populate_db import populate


class TestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.app = app.test_client()
        db.create_all()
        #populate(db)

    def tearDown(self):
        db.session.remove() 
        db.drop_all()

    def test_index(self):
        res = self.app.get('/')
        assert 'Transparent, efficient aid finance solutions' in res.data
    
    def test_blog(self):
        res = self.app.get('/blog')
        assert 'The blog archive' in res.data
    
    def test_perspectives(self):
        res = self.app.get('/perspectives')
        assert 'Make sure you have the funds in your budget' in res.data
    
    def test_about(self):
        res = self.app.get('/about')
        assert 'At AidHedge our vision is an' in res.data
    
    def test_404(self):
        res = self.app.get('/404')
        self.assertEqual(res.status_code, 404)

    def test_db_users(self):
        new_admin = User(email="admin@gmail.com", role='admin')
        new_user = User(email='robert@azote.se')
        db.session.add(new_user)
        db.session.add(new_admin)
        db.session.commit()

    def test_register_user(self):
        res = self.app.post('/register', data=dict(email='numi.lejon@gmail.com'), follow_redirects=True)
        assert 'Welcome to our tool for currency risk analysis!' in res.data
    
    def test_logout_user(self):
        res = self.app.get('/logout', follow_redirects=True)
        assert 'Transparent, efficient aid finance solutions' in res.data
    
    #def test_login_user(self):
    #    res = self.app.post('/login', data=dict(email='numi.lejon@gmail.com'), follow_redirects=True)
    #    assert 'Welcome to our tool for currency risk analysis!' in res.data

    def test_db_project(self):
        pass
    def test_user_login(self):
        pass
    

if __name__ == '__main__':
    unittest.main()
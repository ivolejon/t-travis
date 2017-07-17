# coding: utf-8
from flask import Flask


app = Flask(__name__,template_folder='views')
assets = Environment(app)
app.static_folder = 'static'

app.config['url_map.strict_slashes'] = False
app.url_map.strict_slashes = False
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ['SQLALCHEMY_DATABASE_URI']
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SECRET_KEY'] = os.environ['SECRET_KEY']
app.config['SECURITY_PASSWORD_SALT'] = os.environ['SECURITY_PASSWORD_SALT']
# mail settings
app.config['MAIL_SERVER'] = 'smtp.azote.se'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = False
app.config['MAIL_USERNAME'] = os.environ['APP_MAIL_USERNAME']
app.config['MAIL_PASSWORD'] = os.environ['APP_MAIL_PASSWORD']
app.config['MAIL_DEFAULT_SENDER'] = 'no-reply@aidhedge.org'
#app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 259200 # 72 timmar
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 691200 # 8 dagar

try:
    if os.environ['DEBUG'] == "True":
        app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0
        app.debug = bool(os.environ['DEBUG'])
        app.config["DEBUG_TB_INTERCEPT_REDIRECTS"] = False
except:
    app.log.error()

    
login_manager = LoginManager()
login_manager.init_app(app)

login_manager.login_view = 'auth.login'

mail = Mail(app)

def send_email(to, subject, template):
    msg = Message(
        subject,
        recipients=[to],
        html=template,
        sender=app.config['MAIL_DEFAULT_SENDER']
    )
    mail.send(msg)

#Template filters
@app.template_filter('toUrl')
def to_url(s):
    s = s.lower().replace(' ','_')
    return s

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))
    #return User.get_id(user_id)

@app.before_request
def before_request():
    g.user = current_user

@login_manager.unauthorized_handler
def unauthorized_handler():
    return redirect(url_for('ViewIndex.index'))

from routes.index import ViewIndex
from routes.dashboard import ViewDashboard
from routes.results import ViewResults
from routes.admin import ViewAdmin
from routes.blog import ViewBlog
from errors import errorHandler
from routes.TaskManager import TaskManager
from routes.auth import auth
from lib.misc import Misc
from models import User


app.register_blueprint(ViewIndex)
app.register_blueprint(ViewDashboard)
app.register_blueprint(errorHandler)
app.register_blueprint(TaskManager)
app.register_blueprint(auth)
app.register_blueprint(Misc)
app.register_blueprint(ViewResults)
app.register_blueprint(ViewBlog)
app.register_blueprint(ViewAdmin)
app.config['TEMPLATES_AUTO_RELOAD'] = True
if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)

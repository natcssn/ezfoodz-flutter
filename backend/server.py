import flask
from login import Login
from register import Register
from flask_cors import CORS

app = flask.Flask(__name__)
CORS(app)
app.static_folder = './Static'


@app.route('/login',methods=['GET'])
def login():
    return flask.send_from_directory(app.static_folder, 'login.html')

@app.route('/register',methods=['GET'])
def register():
    return flask.send_from_directory(app.static_folder, 'register.html')

@app.route('/loginbackend',methods=['POST'])
def loginbackend():
    global sendStatus
    data = flask.request.get_json()
    print("\n",data)
    sendStatus = Login(data['username'], data['password'])
    return sendStatus

@app.route('/registerbackend',methods=['POST'])
def registerbackend():
    global sendStatus
    data = flask.request.get_json()
    print("\n",data)
    sendStatus = Register(data['username'], data['password'])
    return sendStatus

@app.route('/',methods=['GET'])
def index():
    return flask.send_from_directory(app.static_folder, 'nothing.html')

app.run(debug=True,port=6969)
 
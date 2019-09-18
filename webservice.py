from flask import Flask, url_for, request
import subprocess,requests
app = Flask(__name__)

@app.route('/register',methods = ['POST'])
def login():
   if request.method == 'POST':
      nama = request.form['nama']
      email= request.form['email']
      pass1=request.form['pass1']

      params = (
      	('step', '2'),
      )
      data = {
      'weblog_title': nama,
      'user_name': nama,
      'admin_password': pass1,
      'admin_password2': pass1,
      'pw_weak': '1',
      'admin_email': email
      }
   	
      subprocess.call(["/opt/script/addUser.sh",nama,pass1,email]) 
      response = requests.post('https://'+nama+'.ku/wp-admin/install.php', params=params, data=data, verify=False)
      return  'Installation done , you will get an email'
if __name__ == '__main__':
   app.run(host='0.0.0.0',debug=True)

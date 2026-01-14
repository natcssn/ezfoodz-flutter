
def Login(username, password):
    import sqlalchemy
    engine = sqlalchemy.create_engine('sqlite:///Databases/login.db', echo=True)
    conn = engine.connect()
    
    result = conn.execute(sqlalchemy.text(f"SELECT * FROM logins WHERE username = '{username}'"))
    result=result.fetchall()
    if result != []:
        import bcrypt
        # Verify the password
        if bcrypt.checkpw(password.encode('utf-8'), result[0][1].encode('utf-8')):
            conn.close()
            return "Login successful"
        else:
            conn.close()
            return "Incorrect password"
    else:
        conn.close()
        return "Username does not exist"

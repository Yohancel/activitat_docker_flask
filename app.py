from flask import Flask
import psycopg2

app = Flask(__name__)

@app.route("/")
def hello():
    db_status = "Estat desconegut"
    try:
        # Intentem connectar a la base de dades utilitzant el nom del servei de docker-compose
        conn = psycopg2.connect(
            host="postgres",
            database="flaskdb",
            user="psqluser",
            password="psqlpassword"
        )
        conn.close()
        db_status = "Connexió a Postgres: <b>OK</b>"
    except Exception as e:
        db_status = f"Connexió a Postgres: <b>ERROR</b> ({e})"

    html = f"""
    <html>
        <head><title>Activitat Docker</title></head>
        <body style="font-family: sans-serif; text-align: center; margin-top: 50px;">
            <h1>Hola món! Aquesta és l'aplicació Flask.</h1>
            <p>{db_status}</p>
        </body>
    </html>
    """
    return html

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)

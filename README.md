# Servei Flask

Aquest directori conté els fitxers necessaris per construir la imatge personal>

## Què inclou aquesta imatge?
- **Python 3.10** amb `pip`.
- **Flask** i **Gunicorn** per servir l'aplicació web.
- **psycopg2** per poder connectar-se a la base de dades Postgres.
- **Servidor SSH** per permetre l'accés remot al contenidor.
- **Supervisor** com a gestor de processos per mantenir vius tant `sshd` com `>

## Fitxers
- `Dockerfile`: L'arxiu d'instruccions per compilar la imatge.
- `requirements.txt`: Llista de llibreries de Python que s'instal·len automàti>
- `supervisord.conf`: Configuració perquè arrenquin els dos processos requerit>
- `app.p## Ports
Els ports exposats (i que mapegem al `docker-compose.yaml` al nostre entorn lo>
- **8000**: Gunicorn (aplicació web).
- **22**: SSH. (mapejat al 2222 del teu host local).

## Comprovació de connectivitat
Un cop l'entorn de Docker Compose estigui engegat:

1. **Aplicació Web**: Entra a `http://localhost:8000` i hauràs de veure la web>
2. **SSH**: Pots connectar-te des de fora executant `ssh root@localhost -p 222>

y`: Aplicació de prova que fa una connexió a la base de dades i mostra>


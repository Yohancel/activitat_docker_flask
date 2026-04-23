FROM public.ecr.aws/docker/library/python:3.10-slim

# Evitar prompts interactius
ENV DEBIAN_FRONTEND=noninteractive

# Instal·lar SSH i dependències del sistema per compilar psycopg2
RUN apt-get update && apt-get install -y \
    openssh-server \
    libpq-dev \
    gcc \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Configurar SSH (user: root, pass: root)
RUN mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Configurar el directori de treball
WORKDIR /app

# Instal·lar dependències de Python
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copiar el codi de l'aplicació i la configuració de supervisor
COPY app.py /app/app.py
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exposar ports per SSH i Gunicorn
EXPOSE 22 8000

# Executar supervisor per arrencar tant SSH com Gunicorn
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

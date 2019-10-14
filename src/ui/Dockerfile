FROM python:3
ADD . /
RUN pip install -r requirements.txt -r requirements-test.txt

WORKDIR ui
ENV FLASK_APP=ui.py

CMD [ "gunicorn", "ui:app", "-b 0.0.0.0" ]

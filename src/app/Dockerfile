FROM python:3.10.0a6-slim
ADD . /

ENV EXCLUDE_URLS=".*github.com"

RUN pip install -r requirements.txt -r requirements-test.txt

CMD [ "python", "-u", "crawler/crawler.py", "https://vitkhab.github.io/search_engine_test_site/" ]

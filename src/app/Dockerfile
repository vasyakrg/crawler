FROM python:3
ADD . /

RUN pip install -r requirements.txt -r requirements-test.txt

CMD [ "python", "-u", "crawler/crawler.py", "https://vitkhab.github.io/search_engine_test_site/" ]

FROM python:3.9

COPY . /app
WORKDIR /app


RUN git clone https://github.com/openai/CLIP
RUN git clone https://github.com/CompVis/taming-transformers.git
RUN rm -Rf clipit
RUN git clone https://github.com/mfrashad/clipit.git
RUN pip install -r /app/requirements.txt
RUN git clone https://github.com/BachiLi/diffvg
RUN cd diffvg
RUN git submodule update --init
RUN python setup.py install
RUN cd ..

RUN mkdir -p steps
RUN mkdir -p models
FROM registry.cn-beijing.aliyuncs.com/kk/kk-logic:latest

COPY ./web/job /web/job
COPY ./static/job /static/job
COPY ./config/env.ini /config/env.ini

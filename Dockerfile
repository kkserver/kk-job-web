FROM registry.cn-beijing.aliyuncs.com/kk/kk-micro:latest

COPY ./api/job /api/job

COPY ./web/job /web/job

COPY ./lua/job /lib/lua/job

COPY ./lua/conf/job.lua /lib/lua/conf/job.lua

COPY ./static/job /static/job

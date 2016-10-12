FROM registry.cn-hangzhou.aliyuncs.com/kk/kk-web:debug

COPY ./@app/job /@app/job

COPY ./lib/lua/job /lib/lua/job

COPY ./lib/lua/conf /lib/lua/conf

COPY ./static/job /static/job


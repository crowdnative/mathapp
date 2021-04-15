FROM golang:1.15.7-buster
ARG GROUP_ID
ARG USER_ID
ENV APP_USER app
ENV APP_HOME /go/src/mathapp
RUN groupadd --gid $GROUP_ID app
RUN useradd -m -l --uid $USER_ID --gid $GROUP_ID $APP_USER
RUN mkdir -p $APP_HOME
RUN chown -R $APP_USER:$APP_USER $APP_HOME
RUN go env -w GO111MODULE=on
RUN go env -w GOFLAGS=-mod=vendor
RUN go get -u github.com/beego/bee/v2
WORKDIR $APP_HOME
USER $APP_USER
EXPOSE 8010
CMD ["bee", "run"]

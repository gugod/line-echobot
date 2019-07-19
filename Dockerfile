FROM perl:5.30

WORKDIR /app
COPY cpanfile /app
RUN cpanm -q --notest --no-man-pages --installdeps .

ENV PORT 3000
EXPOSE 3000
CMD plackup -I ./lib --listen :$PORT app.psgi

COPY . /app

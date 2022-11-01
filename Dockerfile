FROM perl:latest

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim

RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Minilla
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Amon2
# DBD::SQLite is too slow in building process.
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features DBD::SQLite LWP::Protocol::https DBD::mysql
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Catalyst::Runtime
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features DBIx::Class
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Dist::Milla
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Tiffany
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Task::BeLike::TOKUHIROM

WORKDIR /target/

CMD [ "/bin/bash", "-c", "cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features --installdeps --with-configure --with-develop . && minil release" ]


FROM seravo/fastapi:latest
ARG APT_PROXY
USER user

COPY --chown=user:user requirements.txt .
RUN pip3 install -r requirements.txt

COPY seravo $APPDIR/seravo/

CMD ["seravo.main:app"]
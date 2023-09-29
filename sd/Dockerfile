RUN FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel

ARG BASE=/root
ARG SDBASE=$BASE/stable-diffusion-webui
ARG TCPPORT=7860

WORKDIR $BASE
CMD git clone --branch sd --depth=1 https://github.com/ljkrajewski/runpod_ai.git && \
    cd runpod_ai && \
    bash run_me_first.sh && \
    cd sd && \
    sed -i "s/BASE=\"\/workspace\"/BASE=\"$(echo $BASE | sed 's/\//\\\//')\"/" auto1111.sh && \
    sed -i 's/.\/webui.sh -f/#.\/webui.sh -f/' auto1111.sh && \
    bash auto1111.sh

CMD echo "" >> ./start.sh && \
    echo "$SDBASE/webui.sh -f" >> ./start.sh
EXPOSE $TCPPORT
CMD [ "/start.sh" ]

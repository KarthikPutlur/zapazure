FROM owasp/zap2docker-stable
COPY DefaultContext.context DefaultContext.context
WORKDIR /zap
RUN mkdir wrk
RUN ./zap-full-scan.py -t http://demo.testfire.net -n DefaultContext.context -d -r report1.html; \
	wget https://github.com/git/git/archive/v2.17.1.tar.gz; \
	tar zxvf v2.17.1.tar.gz; \
    cd wrk; \
	git init; \
	git config --global user.email "sputlur@woolworths.com.au"; \
	git config --global user.name "Karthik"; \
	git remote add origin https://sputlur:uvy2twjcojnwapk3umupfdw32nhtyfmfuq5xb3w5w7lymqnrp6sq@dev.azure.com/sputlur/zap_reports/_git/zap_reports; \
	git pull https://sputlur:uvy2twjcojnwapk3umupfdw32nhtyfmfuq5xb3w5w7lymqnrp6sq@dev.azure.com/sputlur/zap_reports/_git/zap_reports master; \
    git add .; \
	git commit -m "Adding file from zap container"; \
	git push -u origin --all
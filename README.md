Build and run example:  
cd examples/demo  
./build.sh

find port mapping digipoort and overheid api interfaces on port 8080
kubectl get svc -n ebms-adapter-demo

for example:
NAME        TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)                         AGE
digipoort   NodePort   10.104.227.35   <none>        8080:30587/TCP,8888:31111/TCP   7m57s
overheid    NodePort   10.102.250.90   <none>        8080:31647/TCP,8888:30800/TCP   7m57s

digipoort api = http://10.104.227.35:30587
overheid api = http://10.102.250.90.35:31647

or when using minikube execute the following commands to open the urls in a browser:
minikube service digipoort -n ebms-adapter-demo
minikube service overheid -n ebms-adapter-demo


open [digipoort api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.service.cpa.CPAsPage in your browser and upload cpa cpa.xml (from the examples directory)  
open [overheid api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.service.cpa.CPAsPage in your browser and upload cpa cpa.xml (from the examples directory)

- next from the digipoort console you can:
	- execute a ping the overheid adapter at [digipoort api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.service.message.PingPage
		- CPA Id:     cpaStubEBF.rm.https.signed
		- From Party: urn:osb:oin:00000000000000000000
		- To Party:   urn:osb:oin:00000000000000000001
	- send a message to the overheid adapter at [digipoort api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.service.message.SendMessagePageX
		- CPA Id:        cpaStubEBF.rm.https.signed
		- From Party Id: urn:osb:oin:00000000000000000000
		- Service:       urn:osb:services:osb:afleveren:1.1$1.0
		- Action:        afleveren
	- view traffic at [digipoort api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.message.TrafficPage

- next from the overheid console you can:
	- execute a ping the digipoort adapter at [overheid api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.service.message.PingPage
		- CPA Id:     cpaStubEBF.rm.https.signed
		- From Party: urn:osb:oin:00000000000000000001
		- To Party:   urn:osb:oin:00000000000000000000
	- send a message to the digipoort adapter at [overheid api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.service.message.SendMessagePageX
		- CPA Id:        cpaStubEBF.rm.https.signed
		- From Party Id: urn:osb:oin:00000000000000000001
		- Service:       urn:osb:services:osb:aanleveren:1.1$1.0
		- Action:        aanleveren
	- view traffic at [overheid api]/wicket/bookmarkable/nl.clockwork.ebms.admin.web.message.TrafficPage

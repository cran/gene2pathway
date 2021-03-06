get.element.relations.by.pathway = function(pathway.id){    	
	KEGGserver <-  SSOAP:::SOAPServer("http://soap.genome.jp/keggapi/request_v6.2.cgi")
	KEGGxmlns = "SOAP/KEGG"
	KEGGaction = "SOAP/KEGG"
	KEGGsoapns = "1.1"			
	a = SSOAP:::.SOAP(KEGGserver, "get_element_relations_by_pathway", .soapArgs = list(pathway_id = pathway.id),
	action = KEGGaction, xmlns = KEGGxmlns, nameSpaces =SSOAP::: SOAPNameSpaces(version = KEGGsoapns))
	R = t(sapply(a, function(aa) cbind(as.character(aa["element_id1"]), as.character(aa["element_id2"]))))
	R = matrix(R, ncol=2)
}

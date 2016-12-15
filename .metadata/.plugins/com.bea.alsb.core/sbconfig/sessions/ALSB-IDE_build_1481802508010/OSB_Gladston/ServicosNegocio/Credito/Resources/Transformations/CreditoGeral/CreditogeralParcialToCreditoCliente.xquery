<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$resultadoParcialVerificaCreditoCliente1" element="ns1:resultadoParcialVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoGeral/CreditogeralParcialToCreditoCliente/";

declare function xf:CreditogeralParcialToCreditoCliente($resultadoParcialVerificaCreditoCliente1 as element(ns1:resultadoParcialVerificaCreditoCliente))
    as element(ns1:resultadoVerificaCreditoCliente) {
        <ns1:resultadoVerificaCreditoCliente>
            <ns1:score>
                {
                    if (fn:count($resultadoParcialVerificaCreditoCliente1/ns1:credito/ns0:restricoes/ns0:restricao/ns0:valor) > 3) then
                    	(0 + $resultadoParcialVerificaCreditoCliente1/ns1:scoreCreditoExterno)
                    else
                    	if (fn:sum($resultadoParcialVerificaCreditoCliente1/ns1:credito/ns0:restricoes/ns0:restricao/ns0:valor) < 200) then
                    		(500 + $resultadoParcialVerificaCreditoCliente1/ns1:scoreCreditoExterno)
                    	else
                    		if($resultadoParcialVerificaCreditoCliente1/ns1:indicaWhiteList = xs:boolean('true')) then
                    			(900 + $resultadoParcialVerificaCreditoCliente1/ns1:scoreCreditoExterno)
                    		else
                    			(0 + $resultadoParcialVerificaCreditoCliente1/ns1:scoreCreditoExterno)
                }
</ns1:score>
            <ns1:pessoa>
                <ns0:cnpj>{ data($resultadoParcialVerificaCreditoCliente1/ns1:pessoa/ns0:cnpj) }</ns0:cnpj>
            </ns1:pessoa>
        </ns1:resultadoVerificaCreditoCliente>
};

declare variable $resultadoParcialVerificaCreditoCliente1 as element(ns1:resultadoParcialVerificaCreditoCliente) external;

xf:CreditogeralParcialToCreditoCliente($resultadoParcialVerificaCreditoCliente1)]]></con:xquery>
    <con:dependency location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd">
        <con:schema ref="OSB_Gladston/EBS/Credito/xsd/ParametrosCreditoGeral"/>
    </con:dependency>
</con:xqueryEntry>
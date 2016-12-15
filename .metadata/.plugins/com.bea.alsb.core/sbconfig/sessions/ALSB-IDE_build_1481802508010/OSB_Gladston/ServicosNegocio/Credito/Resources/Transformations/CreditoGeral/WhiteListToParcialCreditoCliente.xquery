<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$resultadoVerificaWhiteList1" element="ns1:resultadoVerificaWhiteList" location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoParcialVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoGeral/WhiteListToParcialCreditoCliente/";

declare function xf:WhiteListToParcialCreditoCliente($resultadoVerificaWhiteList1 as element(ns1:resultadoVerificaWhiteList))
    as element(ns1:resultadoParcialVerificaCreditoCliente) {
        <ns1:resultadoParcialVerificaCreditoCliente>
            <ns1:credito>
                <ns0:pessoa>
                    <ns0:id>{ data($resultadoVerificaWhiteList1/ns1:mensagemRetorno/ns0:codigo) }</ns0:id>
                </ns0:pessoa>
                <ns0:indicaWhiteList>{ data($resultadoVerificaWhiteList1/ns1:mensagemRetorno/ns0:isAtivo) }</ns0:indicaWhiteList>
            </ns1:credito>
        </ns1:resultadoParcialVerificaCreditoCliente>
};

declare variable $resultadoVerificaWhiteList1 as element(ns1:resultadoVerificaWhiteList) external;

xf:WhiteListToParcialCreditoCliente($resultadoVerificaWhiteList1)]]></con:xquery>
    <con:dependency location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd">
        <con:schema ref="OSB_Gladston/EBS/Credito/xsd/ParametrosCredito"/>
    </con:dependency>
    <con:dependency location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd">
        <con:schema ref="OSB_Gladston/EBS/Credito/xsd/ParametrosCreditoGeral"/>
    </con:dependency>
</con:xqueryEntry>
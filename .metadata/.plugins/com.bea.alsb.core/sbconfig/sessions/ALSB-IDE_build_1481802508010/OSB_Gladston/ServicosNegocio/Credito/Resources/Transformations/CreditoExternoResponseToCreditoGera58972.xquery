<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$resultadoVerificaCreditoExterno" element="ns1:resultadoVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoVerificaCreditoCliente" location="../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoExternoResponseToCreditoGeralCliente/";

declare function xf:CreditoExternoResponseToCreditoGeralCliente($resultadoVerificaCreditoExterno as element(ns1:resultadoVerificaCreditoExterno))
    as element(ns1:resultadoVerificaCreditoCliente) {
        <ns1:resultadoVerificaCreditoCliente>
            <ns1:pessoa>
                <ns0:id>{ data($resultadoVerificaCreditoExterno/ns1:credito/ns0:pessoa/ns0:id) }</ns0:id>
                <ns0:nome>{ data($resultadoVerificaCreditoExterno/ns1:credito/ns0:pessoa/ns0:nome) }</ns0:nome>
                <ns0:dataNascimento>{ data($resultadoVerificaCreditoExterno/ns1:credito/ns0:pessoa/ns0:dataNascimento) }</ns0:dataNascimento>
                <ns0:cnpj>{ data($resultadoVerificaCreditoExterno/ns1:credito/ns0:pessoa/ns0:cnpj) }</ns0:cnpj>
                <ns0:telefone>{ data($resultadoVerificaCreditoExterno/ns1:credito/ns0:pessoa/ns0:telefone) }</ns0:telefone>
            </ns1:pessoa>
        </ns1:resultadoVerificaCreditoCliente>
};

declare variable $resultadoVerificaCreditoExterno as element(ns1:resultadoVerificaCreditoExterno) external;

xf:CreditoExternoResponseToCreditoGeralCliente($resultadoVerificaCreditoExterno)]]></con:xquery>
    <con:dependency location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd">
        <con:schema ref="OSB_Gladston/EBS/Credito/xsd/ParametrosCredito"/>
    </con:dependency>
    <con:dependency location="../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd">
        <con:schema ref="OSB_Gladston/EBS/Credito/xsd/ParametrosCreditoGeral"/>
    </con:dependency>
</con:xqueryEntry>
<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$resultadoCreditLegacy1" element="ns0:ResultadoCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ResultadoCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)

declare namespace ns0 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/a_a/";

declare function xf:a_a($resultadoCreditLegacy1 as element(ns0:ResultadoCreditLegacy))
    as element(ns0:ResultadoCreditLegacy) {
        <ns0:ResultadoCreditLegacy>
            <ns0:cpf>{ data($resultadoCreditLegacy1/ns0:cpf) }</ns0:cpf>
                <ns0:restricoes>
                        {
                            for $res in ($resultadoCreditLegacy1/ns0:restricoes) 
                           
                            return
                                $res/ns0:restricao/ns0:ds_restricao/text()
                        }
					
                </ns0:restricoes>
        </ns0:ResultadoCreditLegacy>
};

declare variable $resultadoCreditLegacy1 as element(ns0:ResultadoCreditLegacy) external;

xf:a_a($resultadoCreditLegacy1)]]></con:xquery>
    <con:dependency location="../Interfaces/Schemas/CreditLegacy.xsd">
        <con:schema ref="OSB_Gladston/ServicosNegocio/Credito/Resources/Interfaces/Schemas/CreditLegacy"/>
    </con:dependency>
</con:xqueryEntry>
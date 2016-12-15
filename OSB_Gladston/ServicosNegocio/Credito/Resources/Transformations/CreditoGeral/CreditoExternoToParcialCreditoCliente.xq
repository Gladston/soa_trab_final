(:: pragma bea:global-element-parameter parameter="$resultadoVerificaCreditoExterno1" element="ns1:resultadoVerificaCreditoExterno" location="../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoParcialVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoGeral/CreditoExternoToParcialCreditoCliente/";

declare function xf:CreditoExternoToParcialCreditoCliente($resultadoVerificaCreditoExterno1 as element(ns1:resultadoVerificaCreditoExterno))
    as element(ns1:resultadoParcialVerificaCreditoCliente) {
        <ns1:resultadoParcialVerificaCreditoCliente>
            <ns1:scoreCreditoExterno>
                {
                    if (data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:valor) > 400) then
                        (200)
                    else 
                        0
                }
</ns1:scoreCreditoExterno>
            <ns1:pessoa>
                <ns0:id>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:id) }</ns0:id>
                <ns0:nome>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:nome) }</ns0:nome>
                <ns0:dataNascimento>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:dataNascimento) }</ns0:dataNascimento>
                <ns0:cnpj>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:cnpj) }</ns0:cnpj>
                <ns0:telefone>{ data($resultadoVerificaCreditoExterno1/ns1:credito/ns0:pessoa/ns0:telefone) }</ns0:telefone>
            </ns1:pessoa>
        </ns1:resultadoParcialVerificaCreditoCliente>
};

declare variable $resultadoVerificaCreditoExterno1 as element(ns1:resultadoVerificaCreditoExterno) external;

xf:CreditoExternoToParcialCreditoCliente($resultadoVerificaCreditoExterno1)

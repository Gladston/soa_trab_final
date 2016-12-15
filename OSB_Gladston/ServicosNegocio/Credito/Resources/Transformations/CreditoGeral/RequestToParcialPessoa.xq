(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoCliente1" element="ns1:parametrosVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoParcialVerificaCreditoCliente" location="../../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Gladston";
declare namespace xf = "http://tempuri.org/OSB_Gladston/ServicosNegocio/Credito/Resources/Transformations/CreditoGeral/RequestToParcialPessoa/";

declare function xf:RequestToParcialPessoa($parametrosVerificaCreditoCliente1 as element(ns1:parametrosVerificaCreditoCliente))
    as element(ns1:resultadoParcialVerificaCreditoCliente) {
        <ns1:resultadoParcialVerificaCreditoCliente>
            <ns1:pessoa>
                <ns0:id>{ data($parametrosVerificaCreditoCliente1/ns1:pessoa/ns0:id) }</ns0:id>
                <ns0:nome>{ data($parametrosVerificaCreditoCliente1/ns1:pessoa/ns0:nome) }</ns0:nome>
                <ns0:dataNascimento>{ data($parametrosVerificaCreditoCliente1/ns1:pessoa/ns0:dataNascimento) }</ns0:dataNascimento>
                <ns0:cnpj>{ data($parametrosVerificaCreditoCliente1/ns1:pessoa/ns0:cnpj) }</ns0:cnpj>
                <ns0:telefone>{ data($parametrosVerificaCreditoCliente1/ns1:pessoa/ns0:telefone) }</ns0:telefone>
            </ns1:pessoa>
        </ns1:resultadoParcialVerificaCreditoCliente>
};

declare variable $parametrosVerificaCreditoCliente1 as element(ns1:parametrosVerificaCreditoCliente) external;

xf:RequestToParcialPessoa($parametrosVerificaCreditoCliente1)

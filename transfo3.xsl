<?xml version="1.0" encoding="UTF-8"?>

<!-- Afficher pour chaque contrat le client associe -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <head>
            <meta charset="UTF-8"/>
            <title>Transformation 3</title>
            <link rel="stylesheet" type="text/css" href="theme.css" />
        </head>
        <body>
            <h2>Les contrats de chaque client</h2>
            <table border="1" class="table_container">
                    <xsl:apply-templates select="assurance/clients/client" />
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="assurance/clients/client">
    <xsl:variable name="id" select="@id_c"/>
    <tr>
        <td><xsl:value-of select="@nom_c"/>
            <xsl:text> </xsl:text><xsl:value-of select="@prenom_c"/></td>
        <xsl:apply-templates select="/assurance/contrats/contrat">
            <xsl:with-param name="id" select="$id"/>
        </xsl:apply-templates>
    </tr>

</xsl:template>

<xsl:template match="/assurance/contrats/contrat">

    <xsl:param name="id"/>
        <xsl:if test="@id_c = $id">
        <tr>
        <table class="table_result">
            <tr>
                <th>Nom du contrat</th>
                <th>Cotisation</th>
                <th>Indemnites</th>
            </tr>
            <tr>
                <td><xsl:value-of select="@type" /></td>
                <td><xsl:value-of select="cotisation" /></td>
                <td><xsl:value-of select="indemnites" /></td>
            </tr>
        </table>
        </tr>
    </xsl:if>
 
</xsl:template>


</xsl:stylesheet>

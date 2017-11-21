<?xml version="1.0" encoding="UTF-8"?>

<!-- Afficher pour chaque contrat le client associe -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
        Les contrats de chaque client
            <table border="1">
                    <xsl:apply-templates select="assurance/clients/client" />
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="assurance/clients/client">
    <xsl:variable name="id" select="@id_c"/>
    <tr>
        <td><xsl:value-of select="@nom_c"/></td>
        <td><xsl:value-of select="@prenom_c"/></td>
        <xsl:apply-templates select="/assurance/contrats/contrat">
            <xsl:with-param name="id" select="$id"/>
        </xsl:apply-templates>
    </tr>
</xsl:template>

<xsl:template match="/assurance/contrats/contrat">

    <xsl:param name="id"/>
        <xsl:if test="@id_c = $id">
        <tr>
        <table border="1">
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

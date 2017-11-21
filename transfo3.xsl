<?xml version="1.0" encoding="UTF-8"?>

<!-- Afficher pour chaque contrat le client associe -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html>
        <body>
        Les contrats de chaque client
            <table>
                <tr>
                    <th>Nom client</th>
                    <th>Prenom client</th>
                    <xsl:apply-templates select="assurance/clients/client" />
                </tr>
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
        <ul>
        <li><xsl:value-of select="@type" /></li>
        <li><xsl:value-of select="cotisation" /></li>
        <li><xsl:value-of select="indemnites" /></li>
        </ul>
    </xsl:if>
 
</xsl:template>


</xsl:stylesheet>

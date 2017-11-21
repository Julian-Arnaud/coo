<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/assurance">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Transformation 1</title>
    <link rel="stylesheet" type="text/css" href="theme.css" />
</head>
<body>
    <h2>Liste des employes et de leurs informations</h2>
    <table class="table_container" border="1">
        <tr>
            <th>Identifiant</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Adresse</th>
            <th>Salaire</th>
        </tr>
    <xsl:for-each select="employes/employe">
        <tr>
            <td><xsl:value-of select="@id_e"/></td>
            <td><xsl:value-of select="@nom_e"/></td>
            <td><xsl:value-of select="@prenom_e"/></td>
            <td><xsl:value-of select="@adresse_e"/></td>
            <td><xsl:value-of select="@salaire"/></td>
        </tr>
    </xsl:for-each>
    </table>
    
    <h2>Liste des clients et de leurs informations</h2>
    <table class="table_container" border="1">
        <tr>
            <th>Indentifiant</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Adresse</th>
        </tr>
    <xsl:for-each select="clients/client">
        <tr>
            <td><xsl:value-of select="@id_c"/></td>
            <td><xsl:value-of select="@nom_c"/></td>
            <td><xsl:value-of select="@prenom_c"/></td>
            <td><xsl:value-of select="@adresse_c"/></td>
        </tr>
    </xsl:for-each>
    </table>
</body>
</html>
</xsl:template>

</xsl:stylesheet>

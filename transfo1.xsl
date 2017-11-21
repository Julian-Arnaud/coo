<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/assurance">
<html>
<head>
    <meta charset="UTF-8"/>
</head>
<body>
    <h2>Liste des employes et leurs attributs</h2>
    <table>
        <tr>
            <th>id</th>
            <th>nom</th>
            <th>prenom</th>
            <th>adresse</th>
            <th>salaire</th>
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
</body>
</html>
</xsl:template>

</xsl:stylesheet>

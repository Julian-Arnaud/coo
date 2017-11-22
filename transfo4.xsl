<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/assurance">
<html>
<body>
<!-- Salaire minimum -->
<xsl:variable name="min">
<xsl:for-each select="employes/employe">
<xsl:sort select="@salaire" order="ascending"/>
    <xsl:if test="position() = 1">
        <xsl:value-of select="@salaire"/>
    </xsl:if>
</xsl:for-each>
</xsl:variable>

<!-- Salaire maximum -->
<xsl:variable name="max">
<xsl:for-each select="employes/employe">
<xsl:sort select="@salaire" order="descending"/>
    <xsl:if test="position() = 1">
        <xsl:value-of select="@salaire"/>
    </xsl:if>
</xsl:for-each>
</xsl:variable>

<p>Le salaire minimum est de:</p><xsl:value-of select="$min"/>€
<p>Le salaire maximum est de:</p><xsl:value-of select="$max"/>€

<!-- Afficher moyenne des salaires OK-->
<xsl:for-each select="employes">
    <p>Le salaire moyen est de: </p><xsl:value-of select="round(sum(employe/@salaire) div count(employe))"/>€
</xsl:for-each>

<!-- Afficher le nombre moyen de clients par employe -->
<xsl:for-each select="employes/employe">
    <p>L'employé <xsl:value-of select="@nom_e"/>&#160;<xsl:value-of select="@prenom_e"/> gère <xsl:value-of select="count(contrat_ref)"/> contrats</p>
</xsl:for-each>

<!-- Afficher cotisation et indemnites moyennes pour chaque client -->


</body>
</html>
</xsl:template>



</xsl:stylesheet>

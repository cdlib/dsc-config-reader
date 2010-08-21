<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:param name="database_config_file" select="'./testdatabases.xml'"/>
  <xsl:param name="database_name" select="'default-ro'"/>

  <xsl:variable name="databases" select="document($database_config_file)"/> 
  <xsl:variable name="db" select="$databases/databases/database[@name=$database_name]"/> 

  <xsl:param name="sqlConnect.database"> 
    <xsl:text>jdbc:mysql://</xsl:text> 
    <xsl:value-of select="$db/host"/> 
    <xsl:text>:</xsl:text> 
    <xsl:value-of select="$db/port"/> 
    <xsl:text>/</xsl:text> 
    <xsl:value-of select="$db/name"/> 
  </xsl:param> 
  <xsl:param name="sqlConnect.user" select="$db/user"/> 
  <xsl:param name="sqlConnect.password" select="$db/password"/> 
  <xsl:param name="sqlConnect.driver" select="'com.mysql.jdbc.Driver'"/> 

  <xsl:output omit-xml-declaration="yes"/>

</xsl:stylesheet>

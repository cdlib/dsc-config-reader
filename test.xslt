<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:include href="./config_reader.xsl"/>

  <xsl:output omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:if test="not($sqlConnect.database = 'jdbc:mysql://db.example.org:3333/name1ro' and 
                      $sqlConnect.user = 'user1ro' and
                      $sqlConnect.password = 'pass1ro' and
                      $sqlConnect.driver = 'com.mysql.jdbc.Driver') ">
        <xsl:text>XSLT test failed</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>

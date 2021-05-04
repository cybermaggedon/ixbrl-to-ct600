
def get_computations(doc):
    
    values = {}
    ns = {
        "ix": "http://www.xbrl.org/2013/inlineXBRL",
        "xbrli": "http://www.xbrl.org/2003/instance"
    }
    for elt in doc.findall(".//ix:nonNumeric", ns):
        if elt.text:
            values[elt.get("name")] = elt.text
    for elt in doc.findall(".//ix:nonFraction", ns):
        if elt.text:
            values[elt.get("name")] = elt.text

    elt = doc.find(".//xbrli:entity/xbrli:identifier[1]", ns)
    values["uk-core:UKCompaniesHouseRegisteredNumber"] = elt.text

    return values

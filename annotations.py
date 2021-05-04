
from reportlab.lib.units import mm
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
import datetime
import io

class WriteString:
    def __init__(self, page, x, y):
        self.page = page
        self.x = x
        self.y = y
    def do(self, can, s):
        can.drawString(self.x * mm, self.y * mm, s)

class WriteBool:
    def __init__(self, page, x, y):
        self.page = page
        self.x = x
        self.y = y
    def do(self, can, s):
        if s:
            can.drawString(self.x * mm, self.y * mm, "X")

class SpaceString:
    def __init__(self, page, x, y, pitch):
        self.page = page
        self.x = x
        self.y = y
        self.pitch = pitch
    def do(self, can, s):
        for i in range(0, len(s)):
            can.drawString((self.x + self.pitch * i) * mm, self.y * mm, s[i])

class WritePounds:
    def __init__(self, page, x, y):
        self.page = page
        self.d = WriteString(page, x, y)
    def do(self, can, s):
        s = s.replace(",", "")
        s = int(float(s))
        fmt = "%d"
        s = fmt % s
        self.d.do(can, s)

class WriteMoney:
    def __init__(self, page, x, y):
        self.page = page
        self.d = WriteString(page, x, y)
    def do(self, can, s):
        s = s.replace(",", "")
        s = float(s)
        fmt = "%.2f"
        s = fmt % s
        self.d.do(can, s)

class SpacePounds:
    def __init__(self, page, x, y, pitch, digits):
        self.page = page
        self.x = x
        self.y = y
        self.pitch = pitch
        self.digits = digits
        self.d = SpaceString(page, x, y, pitch)
    def do(self, can, s):
        s = s.replace(",", "")
        s = int(float(s))
        fmt = "%" + str(self.digits) + "d"
        s = fmt % s
        self.d.do(can, s)

class SpaceMoney:
    def __init__(self, page, x, y, x2, y2, pitch, digits):
        self.page = page
        self.digits = digits
        self.d = SpaceString(page, x, y, pitch)
        self.d2 = SpaceString(page, x2, y2, pitch)
    def do(self, can, s):
        s = s.replace(",", "")

        pounds = int(float(s))
        fmt = "%" + str(self.digits) + "d"
        pounds = fmt % pounds
        self.d.do(can, pounds)

        pence = float(s) - round(float(s))
        pence = round(100 * pence + 0.5)
        
        pence = "%02d" % pence
        self.d2.do(can, pence)

class WriteSpaceDate:
    def __init__(self, page, x, y, x2, y2, x3, y3, pitch):
        self.page = page

        self.d = SpaceString(page, x, y, pitch)
        self.m = SpaceString(page, x2, y2, pitch)
        self.y = SpaceString(page, x3, y3, pitch)

    def do(self, can, s):
        d = datetime.datetime.strptime(s, "%d %B %Y").date()
        self.d.do(can, "%02d" % d.day)
        self.m.do(can, "%02d" % d.month)
        self.y.do(can, "%04d" % d.year)

spec = {
    "ct-comp:CompanyName": WriteString(0, 76, 208),
    "uk-core:UKCompaniesHouseRegisteredNumber": SpaceString(
        0, 148, 199.5, 5.47
    ),
    "ct-comp:TaxReference": SpaceString(0, 137, 190.5, 5.47),
    "ct-comp:StartOfPeriodCoveredByReturn": WriteSpaceDate(
        0, 23.5, 108, 37, 108, 50.5, 108, 5.47
    ),
    "ct-comp:EndOfPeriodCoveredByReturn": WriteSpaceDate(
        0, 143, 108, 156.5, 108, 170, 108, 5.47
    ),
    "company-type": SpaceString(0, 181, 182, 5.47),
    "attached-for-this-period": WriteBool(1, 186.2, 265.5),
    "ct-comp:FinancialYear1CoveredByTheReturn": WriteString(3, 32, 93),
    "ct-comp:FinancialYear2CoveredByTheReturn": WriteString(3, 32, 68),

    "ct-comp:MainPoolAnnualInvestmentAllowance": SpacePounds(
        7, 60.5, 255.8, 5.5, 11
    ),
    "ct-comp:AdjustedTradingProfitOfThisPeriod": SpacePounds(
        1, 117.5, 68.7, 5.5, 11
    ),
    "ct-comp:TradingLossesBroughtForward": SpacePounds(
        1, 117.5, 57, 5.5, 11
    ),
    "ct-comp:NetTradingProfits": SpacePounds(
        1, 117.5, 46, 5.5, 11
    ),
    "ct-comp:NetChargeableGains": SpacePounds(
        2, 118, 148.5, 5.5, 11
    ),
    "ct-comp:ProfitsBeforeOtherDeductionsAndReliefs": SpacePounds(
        2, 118, 94.5, 5.5, 11
    ),
    "ct-comp:TotalManagementExpenses": SpacePounds(
        2, 118, 60.5, 5.5, 11
    ),
    "ct-comp:TotalDeductionsAndReliefs": SpacePounds(
        3, 117.5, 211, 5.5, 11
    ),

    "ct-comp:ProfitsBeforeChargesAndGroupRelief": SpacePounds(
        3, 117.5, 198, 5.5, 11
    ),

    "ct-comp:QualifyingDonations": SpacePounds(
        3, 117.5, 186, 5.5, 11
    ),

    "ct-comp:GroupReliefClaimed": SpacePounds(
        3, 117.5, 177.5, 5.5, 11
    ),

    "ct-comp:GroupReliefClaimedForCarriedForwardLosses": SpacePounds(
        3, 117.5, 169.5, 5.5, 11
    ),

    "ct-comp:TotalProfitsChargeableToCorporationTax": SpacePounds(
        3, 117.5, 161, 5.5, 11
    ),

    "ct-comp:FY1AmountOfProfitChargeableAtFirstRate": WritePounds(
        3, 68, 93
    ),

    "ct-comp:FY2AmountOfProfitChargeableAtFirstRate": WritePounds(
        3, 68, 68
    ),

    "ct-comp:FY1FirstRateOfTax": WritePounds(
        3, 128, 93
    ),

    "ct-comp:FY2FirstRateOfTax": WritePounds(
        3, 128, 68
    ),

    "ct-comp:FY1TaxAtFirstRate": WriteMoney(
        3, 162, 93
    ),

    "ct-comp:FY2TaxAtFirstRate": WriteMoney(
        3, 162, 68
    ),

    "ct-comp:CorporationTaxChargeable": SpaceMoney(
        3, 117.5, 37, 181, 37, 5.5, 11
    ),

    "ct-comp:MarginalRateReliefForRingFenceTradesPayable": SpaceMoney(
        3, 117.5, 28.5, 180.5, 28.5, 5.5, 11
    ),

    "ct-comp:CorporationTaxChargeablePayable": SpaceMoney(
        3, 117.5, 19.5, 180.5, 19.5, 5.5, 11
    ),

    "ct-comp:TotalReliefsAndDeductionsInTermsOfTaxPayable": SpaceMoney(
        4, 117.5, 223, 180.5, 223, 5.5, 11
    ),

    "ct-comp:NetCorporationTaxPayable": SpaceMoney(
        4, 117.5, 145.5, 180.5, 145.5, 5.5, 11
    ),

    "ct-comp:TaxChargeable": SpaceMoney(
        4, 117.5, 54.5, 180.5, 54.5, 5.5, 11
    ),

    "ct-comp:TaxPayable": SpaceMoney(
        5, 117.5, 242.5, 180.5, 242.5, 5.5, 11
    ),

    "declaration-name": WriteString(
        10, 25, 50
    ),

    "declaration-date": WriteSpaceDate(
        10, 23.5, 36, 37, 36, 50.5, 36, 5.5
    ),

    "declaration-status": WriteString(
        10, 25, 22
    ),

    "uk-core:TurnoverRevenue": SpacePounds(
        1, 79, 101, 5.5, 18
    ),


}

def create_annotations(values):
    pages = {}

    for k, v in values.items():
        if k in spec:

            page = spec[k].page
            if page not in pages:
                pages[page] = []

            pages[page].append((spec[k], v))

    return pages

def get_page(annotations, page):

    font="Courier-Bold"
    font_size=12

    buffer = io.BytesIO()
    can = canvas.Canvas(buffer, pagesize=A4)
    can.setFont(font, font_size)

    for elt, val in annotations[page]:
        elt.do(can, val)

    can.save()
    buffer.seek(0)

    return buffer

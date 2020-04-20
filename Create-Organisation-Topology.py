from mininet.topo import Topo


class OrganisationTopo(Topo):
    "Create the organisation topology."

    def __init__(self):
        Topo.__init__(self)

        # Add clients
        financeUser = self.addHost('h11', ip='10.1.0.1', mac='00:00:00:01:00:01')
        salesUser = self.addHost('h12', ip='10.1.0.2', mac='00:00:00:01:00:02')
        publicUser = self.addHost('h19', ip='10.1.0.9', mac='00:00:00:01:00:09')

        # Add distribution switches
        internalSwitch = self.addSwitch('s21', ip='10.2.0.1', mac='00:00:00:02:00:01')
        cloudProviderSwitch = self.addSwitch('s22', ip='10.2.0.2', mac='00:00:00:02:00:02')

        # Add core switches
        financeSwitch = self.addSwitch('s31', ip='10.3.0.1', mac='00:00:00:03:00:01')
        sportsAndSocialSwitch = self.addSwitch('s32', ip='10.3.0.2', mac='00:00:00:03:00:02')
        salesAndMarketingSwitch = self.addSwitch('s33', ip='10.3.0.3', mac='00:00:00:03:00:03')
        publicSwitch = self.addSwitch('s34', ip='10.3.0.4', mac='00:00:00:03:00:04')

        # Add servers
        accountsServer = self.addHost('h41', ip='10.4.0.1', mac='00:00:00:04:00:01')
        payrollServer = self.addHost('h42', ip='10.4.0.2', mac='00:00:00:04:00:02')
        sportsServer = self.addHost('h43', ip='10.4.0.3', mac='00:00:00:04:00:03')
        socialServer = self.addHost('h44', ip='10.4.0.4', mac='00:00:00:04:00:04')
        salesServer = self.addHost('h45', ip='10.4.0.5', mac='00:00:00:04:00:05')
        marketingServer = self.addHost('h46', ip='10.4.0.6', mac='00:00:00:04:00:06')
        brochureServer = self.addHost('h47', ip='10.4.0.7', mac='00:00:00:04:00:07')
        webServer = self.addHost('h48', ip='10.4.0.8', mac='00:00:00:04:00:08')

        # Add links between clients and distribution switches
        self.addLink(financeUser, internalSwitch)
        self.addLink(salesUser, internalSwitch)
        self.addLink(publicUser, cloudProviderSwitch)

        # Add links between distribution switches and core switches
        self.addLink(internalSwitch, financeSwitch)
        self.addLink(internalSwitch, sportsAndSocialSwitch)
        self.addLink(internalSwitch, salesAndMarketingSwitch)
        self.addLink(internalSwitch, publicSwitch)
        self.addLink(cloudProviderSwitch, publicSwitch)

        # Add links between core switches and servers
        self.addLink(financeSwitch, accountsServer)
        self.addLink(financeSwitch, payrollServer)
        self.addLink(sportsAndSocialSwitch, sportsServer)
        self.addLink(sportsAndSocialSwitch, socialServer)
        self.addLink(salesAndMarketingSwitch, salesServer)
        self.addLink(salesAndMarketingSwitch, marketingServer)
        self.addLink(publicSwitch, brochureServer)
        self.addLink(publicSwitch, webServer)


topos = {'organisationtopo': (lambda: OrganisationTopo())}

from diagrams import Cluster, Diagram
import diagrams.aws.network as network
from diagrams.aws.compute import EC2


with Diagram("Example", direction="LR", show=False, outformat="png", filename="architecture"):

    igw = network.InternetGateway("Internet")

    with Cluster("VPC"):
        main_rt = network.RouteTable("Main route table")


        with Cluster("public subnet"):
            public_rt = network.RouteTable("Public route table")
            nacl_1 = network.Nacl("Public NACL")

            # Instances
            ec2 = [ EC2(f"Web-{index}") for index in range(1, 4) ]

            # Get public subnet symbol
            # public_subnet = network.PublicSubnet("Public subnet")
            nat = network.NATGateway("NAT")

        with Cluster("private subnet"):
            nacl_2 = network.Nacl("Private NACL")


            # Instances
            ec2_private = [ EC2(f"Services-{index}") for index in range(1, 3) ]

            # Get private subnet symbol
            # private_subnet = network.PrivateSubnet("Private subnet")
            nat_2 = network.NATGateway("NAT to databases")

        with Cluster("Database subnet"):
            nacl_3 = network.Nacl("Private NACL")


            # Instances
            ec2_database = [ EC2(f"Databases-{index}") for index in range(1, 2) ]

            # Get private subnet symbol
            # private_subnet = network.PrivateSubnet("Private subnet")









    # Relationships 
    igw >> main_rt >> public_rt >> nacl_1 >> ec2
    nat >> nacl_2 >> ec2_private
    nat_2 >> nacl_3 >> ec2_database



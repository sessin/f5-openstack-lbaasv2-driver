.. _f5-openstack-lbaasv2-coding-example:

Coding Example
==============

We've provided some code examples below to help you get started with the F5® OpenStack LBaaSv2 agent and driver. This series demonstrates how to configure basic load balancing via the Neutron CLI. To access the full Neutron LBaaS command set, please see the `OpenStack CLI Documentation <http://docs.openstack.org/cli-reference/neutron.html>`_. LBaaSv2 commands all begin with ``lbaas``.


Create a load balancer
``````````````````````
Use the command below to create a load balancer, specifying the load balancer name and its VIP subnet.

.. code-block:: shell

    $ neutron lbaas-loadbalancer-create --name lb1 private-subnet


Create a listener
`````````````````
Use the command below to create a listener for the load balancer specifying the listener name, load balancer name, protocol type, and protocol port.

.. code-block:: shell

    $ neutron lbaas-listener-create --name listener1 --loadbalancer lb1 --protocol HTTP --protocol-port 80


Create a pool
`````````````
Use the command below to create a pool for the listener specifiying the pool name, load balancing method, listener name, and protocol type.

.. code-block:: shell

    $ neutron lbaas-pool-create --name pool1 --lb-algorithm ROUND_ROBIN --listener listener1 --protocol HTTP


Create a pool member
````````````````````
Use the command below to create a  member for the pool, specifying the subnet, IP address, and protocol port.

.. code-block:: shell

    $ neutron lbaas-member-create --subnet private-subnet --address 172.16.101.89 --protocol-port 80 pool1


Create a health monitor
```````````````````````
Use the command below to create a health monitor for the pool specifying the delay, monitor type, number of retries, timeout period, and pool name.

.. code-block:: shell

    $ neutron lbaas-healthmonitor-create --delay 3 --type HTTP --max-retries 3 --timeout 3 --pool pool1

Create a tls load balancer
``````````````````````````

The example command below shows how to create a listener that uses the ``TERMINATED_HTTPS`` protocol. You'll need to specify the protocol (``TERMINATED_HTTPS``); port; and the location of the `Barbican container <http://docs.openstack.org/developer/barbican/api/quickstart/containers.html>`_ where the certificate is stored.

.. code-block:: shell

    $ neutron lbaas-listener-create --name listener2 --protocol TERMINATED_HTTPS --protocol-port 8443 --loadbalancer lb1 --default-tls-container-ref  http://localhost:9311/v1/containers/db50dbb3-70c2-44ea-844c-202e06203488


.. important::

    You must configure Barbican, Keystone, Neutron, and the F5® agent before you can create a tls load balancer.

    See the `OpenStack LBaaS documentation <https://wiki.openstack.org/wiki/Network/LBaaS/docs/how-to-create-tls-loadbalancer>`_ for further information and configuration instructions for the OpenStack pieces.

    The necessary F5® agent configurations are described in :ref:`Certificate Manager / SSL Offloading`.


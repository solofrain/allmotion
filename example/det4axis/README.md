An IOC for Allmotion EZ4Axis controller.

- Create a `motorN.substitutions` for each controller.

- Edit `motorN.substitutions` to create axes.

- In `st.cmd.base`, for each controller:

    ```
    epicsEnvSet(TTYUSB_INDEX, 0)
    < ez4axis.setup
    ```

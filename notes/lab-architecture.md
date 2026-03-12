# Lab Architecture

Last Updated: 2026-03-11

Purpose:
This document shows how the Toughbook, server, and network devices interact.


------------------------------------------------------------
HIGH LEVEL OVERVIEW
------------------------------------------------------------

                Internet
                    |
                    |
               [ Eero Router ]
                    |
         ---------------------------
         |                         |
         |                         |
     [ Toughbook ]            [ Server ]
     control machine         Optiplex 7010
         |                         |
         | SSH / Browser          |
         |                         |
         |                ----------------------
         |                |    |    |    |     |
         |             Jellyfin Tdarr Portainer
         |                       Uptime Kuma
         |
   ----------------------------------------------
   |                     |                      |
   |                     |                      |
[ Roku / TV ]      [ Other PCs ]        [ Future devices ]

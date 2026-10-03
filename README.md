# Mon Road Trip — bucket list, itinéraires, carnet de voyage

Même famille que les apps budget et projets : front seul (PWA), backend Supabase, design rose pâle.

## Ce que ça fait
- **Bucket list** : pays/endroits à visiter, coche quand visité, petite note sur chacun
- **Road trips** : crée un voyage (titre, dates, pays traversés), puis ouvre-le pour gérer ses **étapes** une par une (lieu, dates d'arrivée/départ, notes)
- **Carnet** : notes de voyage (souvenirs, impressions sur les cultures découvertes), datées, optionnellement liées à un road trip précis — visibles aussi directement dans la fiche du voyage concerné

## 1. Backend (Supabase)
1. supabase.com → nouveau projet (ou réutilise un projet existant si tu veux regrouper tes apps)
2. SQL Editor → colle `supabase-setup.sql` → Run
3. Settings → API → copie Project URL + clé anon public

## 2. Connecter le front
Dans `index.html`, tout en haut du script :
```
const SUPABASE_URL = "COLLE_TON_PROJECT_URL_ICI";
const SUPABASE_ANON_KEY = "COLLE_TA_CLE_ANON_ICI";
```

## 3. Héberger et installer
Même méthode que les apps précédentes (GitHub Pages ou Netlify Drop) avec les 5 fichiers de ce dossier.

## Note technique
Les étapes d'un road trip sont stockées directement dans la ligne du voyage (colonne `stops`,
une liste JSON) plutôt que dans une table séparée — plus simple ici car les étapes n'existent
jamais sans leur voyage parent, contrairement aux projets de l'autre app.

## Idées d'évolution
- Carte interactive de l'itinéraire
- Photos par étape (Supabase Storage)
- Budget par voyage (lien avec l'app budget)

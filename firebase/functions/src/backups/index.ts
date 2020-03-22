import * as dateformat from 'dateformat'
import {auth} from 'google-auth-library'

export const generateBackup = async () => {
    const client = await auth.getClient({
        scopes: [
            'https://www.googleapis.com/auth/datastore',
            'https://www.googleapis.com/auth/cloud-platform'
        ]
    })
    const timestamp = dateformat(Date.now(), 'yyyy-mm-dd')
    const path = `${timestamp}`
    const projectId = await auth.getProjectId()
    const BUCKET_NAME = `${projectId}-firestore-backups`

    const url = `https://firestore.googleapis.com/v1beta1/projects/${projectId}/databases/(default):exportDocuments`
    const backup_route = `gs://${BUCKET_NAME}/${path}`
    return client.request({
        url,
        method: 'POST',
        data: {
            outputUriPrefix: backup_route
        }
    }).then(async (res) => {
        console.log(`Backup saved on folder on ${backup_route}`)
    }).catch(async (e) => Promise.reject({message: `Backup failed on folder [${backup_route}]: ${e.message}`}))
}

export const restoreBackup = async () => {
    console.log('Starting to restore database...');
    const client = await auth.getClient({
        scopes: [
            'https://www.googleapis.com/auth/datastore',
            'https://www.googleapis.com/auth/cloud-platform'
        ]
    })
    const yesterday = new Date
    yesterday.setDate(yesterday.getDate() - 1)
    const timestamp = dateformat(yesterday, 'yyyy-mm-dd')
    const path = `${timestamp}`
    const BUCKET_NAME = `checkin-firestore-backups`

    const projectId = await auth.getProjectId()
    const url = `https://firestore.googleapis.com/v1beta1/projects/${projectId}/databases/(default):importDocuments`
    const backup_route = `gs://${BUCKET_NAME}/${path}`

    console.log(`Backup (${timestamp}) is taken from: ${backup_route}`)
    return client.request({
        url,
        method: 'POST',
        data: {
            inputUriPrefix: backup_route,
        }
    }).then(async (res) => {
        console.log(`Backup restored from folder ${backup_route}`)
    }).catch(async (e) => {
        console.error(`Error: ${e.message}`);
        return Promise.reject({message: e.message});
    })
}